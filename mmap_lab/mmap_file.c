
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <string.h>

int main(void)
{
    int fd;
    struct stat st;
    char *data;

    /* Open the large test file for reading and writing */
    fd = open("test.dat", O_RDWR);

    if (fd == -1)
    {
        perror("open");
        exit(EXIT_FAILURE);
    }

    /* Obtain file size */
    if (fstat(fd, &st) == -1)
    {
        perror("fstat");
        close(fd);
        exit(EXIT_FAILURE);
    }

    if (st.st_size == 0)
    {
        printf("File is empty.\n");
        close(fd);
        return 0;
    }

    printf("File size: %lld bytes\n", (long long)st.st_size);

    /* Map the file into memory */
    data = mmap(NULL,
                st.st_size,
                PROT_READ | PROT_WRITE,
                MAP_SHARED,
                fd,
                0);

    if (data == MAP_FAILED)
    {
        perror("mmap");
        close(fd);
        exit(EXIT_FAILURE);
    }

    printf("File mapped successfully using mmap().\n");

    /* Modify the first five bytes */
    if (st.st_size >= 5)
    {
        memcpy(data, "HELLO", 5);
    }

    /* Synchronize changes with the file */
    if (msync(data, st.st_size, MS_SYNC) == -1)
    {
        perror("msync");
        munmap(data, st.st_size);
        close(fd);
        exit(EXIT_FAILURE);
    }

    printf("File modified successfully using mmap().\n");

    /* Remove the memory mapping */
    if (munmap(data, st.st_size) == -1)
    {
        perror("munmap");
        close(fd);
        exit(EXIT_FAILURE);
    }

    close(fd);

    printf("Memory mapping released successfully.\n");

    return 0;
}

