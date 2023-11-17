#ifdef CONFIG_UPDATES
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <json-c/json.h>

// Callback function to handle the response data
size_t write_callback_updater(void* contents, size_t size, size_t nmemb, void* user_data) {
    size_t real_size = size * nmemb;
    ((char*)user_data)[real_size] = '\0'; // Null-terminate the string
    strcat(user_data, (const char*)contents);
    return real_size;
}

// Function to fetch the latest release tag from a GitHub repository
char* get_latest_release_tag(const char* owner, const char* repo) {
    CURL* curl;
    CURLcode res;

    // Initialize libcurl
    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();

    if (curl) {
        // Set the GitHub API URL with a User-Agent header
        char url[100];
        snprintf(url, sizeof(url), "https://api.github.com/repos/%s/%s/releases/latest", owner, repo);
        curl_easy_setopt(curl, CURLOPT_URL, url);

        // Add a User-Agent header to the request
        curl_easy_setopt(curl, CURLOPT_USERAGENT, "Compfy_Fetch_Version");

        // Set up a buffer to store the response data
        char response_buffer[4096] = {0};
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback_updater);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, response_buffer);

        // Perform the HTTP request
        res = curl_easy_perform(curl);

        // Check for errors
        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        } else {
            // Print the response for debugging
            // printf("Response: %s\n", response_buffer);

            // Parse the JSON response
            struct json_object* json = json_tokener_parse(response_buffer);
            if (json == NULL) {
                fprintf(stderr, "Error parsing JSON response\n");
            } else {
                struct json_object* tag_name;
                json_object_object_get_ex(json, "tag_name", &tag_name);

                // Clean up libcurl
                curl_easy_cleanup(curl);

                // Return the latest release tag
                char* tag = strdup(json_object_get_string(tag_name));
                // printf("Tag: %s\n", tag);
                return tag;
            }
        }
    }

    // Clean up libcurl in case of failure
    curl_easy_cleanup(curl);
    return NULL;
}

int check_for_updates() {
    const char* owner = "allusive-dev";
    const char* repo = "compfy";

    char* latest_tag = get_latest_release_tag(owner, repo);

    if (latest_tag) {
        printf("Your current version is: %s\n", COMPFY_VERSION);
        printf("The latest version is: %s\n", latest_tag);
        free(latest_tag);
    } else {
        printf("Unable to fetch latest release.\n");
    }

    return 0;
}
#endif