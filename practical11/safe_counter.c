
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define NUM_THREADS 4
#define INCREMENTS 1000000

long long counter = 0;

/* Mutex lock */
pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;

void *increment_counter(void *arg)
{
    (void)arg;

    for (long long i = 0; i < INCREMENTS; i++)
    {
        pthread_mutex_lock(&lock);

        counter++;

        pthread_mutex_unlock(&lock);
    }

    return NULL;
}

int main(void)
{
    pthread_t threads[NUM_THREADS];

    /* Create threads */
    for (int i = 0; i < NUM_THREADS; i++)
    {
        int result = pthread_create(
            &threads[i], NULL, increment_counter, NULL
        );

        if (result != 0)
        {
            fprintf(stderr, "pthread_create failed: %d\n", result);
            return EXIT_FAILURE;
        }
    }

    /* Wait for all threads */
    for (int i = 0; i < NUM_THREADS; i++)
    {
        int result = pthread_join(threads[i], NULL);

        if (result != 0)
        {
            fprintf(stderr, "pthread_join failed: %d\n", result);
            return EXIT_FAILURE;
        }
    }

    printf("Expected counter value: %lld\n",
           (long long)NUM_THREADS * INCREMENTS);

    printf("Actual counter value: %lld\n", counter);

    pthread_mutex_destroy(&lock);

    return 0;
}
