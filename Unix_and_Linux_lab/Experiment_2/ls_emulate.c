#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <time.h>

void printPermissions(mode_t mode) {
    printf((S_ISDIR(mode)) ? "d" : "-");
    printf((mode & S_IRUSR) ? "r" : "-");
    printf((mode & S_IWUSR) ? "w" : "-");
    printf((mode & S_IXUSR) ? "x" : "-");
    printf((mode & S_IRGRP) ? "r" : "-");
    printf((mode & S_IWGRP) ? "w" : "-");
    printf((mode & S_IXGRP) ? "x" : "-");
    printf((mode & S_IROTH) ? "r" : "-");
    printf((mode & S_IWOTH) ? "w" : "-");
    printf((mode & S_IXOTH) ? "x" : "-");
}

void listFilesAndDirectories() {
    DIR *dir = opendir(".");
    if (dir == NULL) {
        perror("Unable to open directory");
        return;
    }

    struct dirent *entry;
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0) {
            continue;
        }

        char full_path[1024];
        snprintf(full_path, sizeof(full_path), "%s/%s", ".", entry->d_name);

        struct stat stat_buf;
        if (stat(full_path, &stat_buf) == 0) {
            printf("%s\t\t", entry->d_name);
            printPermissions(stat_buf.st_mode);
            printf("\t%ld\t", stat_buf.st_size);
            printf("%s", ctime(&stat_buf.st_mtime));
            // printf("%s", entry->d_name);
        } else {
            perror("Unable to get file metadata");
        }
    }

    closedir(dir);
}

int main(int argc, char *argv[]) {
    if (argc != 1) {
        printf("Usage: %s <path>\n", argv[0]);
        return 1;
    }

    listFilesAndDirectories();

    return 0;
}
