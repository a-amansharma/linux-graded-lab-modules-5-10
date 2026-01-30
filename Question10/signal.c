#include <stdio.h>
#include <unistd.h>
#include <signal.h>

void handle(int sig){
    if(sig==SIGTERM) printf("SIGTERM received\n");
    if(sig==SIGINT) printf("SIGINT received\n");
    _exit(0);
}

int main(){
    signal(SIGTERM, handle);
    signal(SIGINT, handle);

    if(fork()==0){
        sleep(5);
        kill(getppid(), SIGTERM);
    }

    if(fork()==0){
        sleep(10);
        kill(getppid(), SIGINT);
    }

    while(1) sleep(1);
}
