#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <time.h>

double estimate_pi(int n, int p) {
    int count = 0;
    double x, y;
    unsigned int seed = 42;

    #pragma omp parallel for num_threads(p) reduction(+:count)
    for (int i = 0; i < n/p; i++) {
        x = (double)rand_r(&seed) / RAND_MAX;
        y = (double)rand_r(&seed) / RAND_MAX;
        if (x * x + y * y <= 1.0) {
            count++;
        }
    }

    return 4.0 * (double)count / n;
}

int main(int argc, char *argv[]) {
    struct timeval start_time;
    struct timeval end_time;
    int n = atoi(argv[1]);
    MPI_Init(&argc, &argv);
    int p;
    MPI_Comm_size(MPI_COMM_WORLD, &p);

    gettimeofday(&start_time, NULL);
    double pi = estimate_pi(n, p);
    gettimeofday(&end_time, NULL);
    int u = end_time.tv_usec - start_time.tv_usec;
    int s = end_time.tv_sec - start_time.tv_sec;
    printf("Estimated PI: %f\n", pi);
    printf("Execution time: %d microseconds \n", u);
    printf("Execution time: %d seconds \n", s);

    MPI_Finalize();
    return 0;
}
