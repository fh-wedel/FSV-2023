#define NUM_PHIL 4

int fork[ NUM_PHIL ];  // fork[i]=0: Gabel liegt; 
                       // fork[i]=n >0: Gabel von n Philosophen genommen

proctype phil(int id) {
  do
  :: printf("Philo %d is thinking\n", id);
    
     fork[id]==0 -> fork[id]++;	 // linke nehmen
     fork[(id+1)%NUM_PHIL]==0 -> fork[(id+1)%NUM_PHIL]++; // rechte nehmen

     printf("Philo %d is eating\n", id);

     fork[id]--;                       // linke ablegen
     fork[(id+1)%NUM_PHIL]--;          // rechte ablegen
  od
}

init {
  int i=0;
  do
  :: i>=NUM_PHIL -> break
  :: else -> run phil (i); i++;
  od
}

