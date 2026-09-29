#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

#define SIZE (100 * 1024 * 1024)

int main(void)
{
    char *data;
    pid_t pid;

    data = malloc(SIZE);

    if (data == NULL)
    {
        perror("malloc");
        return 1;
    }

    /* Initialize memory */
    for (size_t i = 0; i < SIZE; i++)
    {
        data[i] = 1;
    }

    printf("Parent PID: %d\n", getpid());
    printf("Memory allocated: 100 MB\n");
    printf("Press Enter to fork...\n");
    getchar();

    pid = fork();

    if (pid < 0)
    {
        perror("fork");
        free(data);
        return 1;
    }

    if (pid == 0)
    {
        /* Child process */
        printf("\nChild PID: %d\n", getpid());
        printf("Parent PID: %d\n", getppid());

        printf("Child created. Press Enter to modify memory...\n");
        getchar();

        /*
         * Modify one byte in every 4096-byte page.
         * This demonstrates Copy-on-Write.
         */
        for (size_t i = 0; i < SIZE; i += 4096)
        {
            data[i] = 2;
        }

        printf("Child modified the memory.\n");
        printf("Press Enter to exit child...\n");
        getchar();

        free(data);
        return 0;
    }
    else
    {
        /* Parent process */
        printf("\nParent PID: %d\n", getpid());
        printf("Child PID: %d\n", pid);

        printf("Parent waiting. Press Enter after checking memory...\n");
        getchar();

        wait(NULL);

        printf("Child finished.\n");

        free(data);
    }

    return 0;
}
