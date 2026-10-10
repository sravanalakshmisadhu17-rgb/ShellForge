
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

#define BUFFER_SIZE 4096

int main(void)
{
    int fd;
    ssize_t bytes_read;
    char buffer[BUFFER_SIZE];
    unsigned long long checksum = 0;

    /* Open the test file */
    fd = open("test.dat", O_RDWR);

    if (fd == -1)
    {
        perror("open");
        exit(EXIT_FAILURE);
    }

    /* Read the entire file in small chunks */
    while ((bytes_read = read(fd, buffer, sizeof(buffer))) > 0)
    {
        for (ssize_t i = 0; i < bytes_read; i++)
        {
            checksum += (unsigned char)buffer[i];
        }
    }

    if (bytes_read == -1)
    {
        perror("read");
        close(fd);
        exit(EXIT_FAILURE);
    }

    /* Return to the beginning of the file */
    if (lseek(fd, 0, SEEK_SET) == -1)
    {
        perror("lseek");
        close(fd);
        exit(EXIT_FAILURE);
    }

    /* Modify the first five bytes */
    if (write(fd, "HELLO", 5) != 5)
    {
        perror("write");
        close(fd);
        exit(EXIT_FAILURE);
    }

    printf("File read successfully using read().\n");
    printf("File modified successfully using write().\n");
    printf("Checksum: %llu\n", checksum);

    close(fd);

    return 0;
}

