

#include <stdio.h>

int maximo(int b, int c){
  if (b>=c){
    return b;
  }
  return c;
}
int cortah(int p[], int n){
  if (n==0){
    return 0;
  }
  int q=-1;// é infinito
  for(int i =1; i<=n; i++){
    q= maximo(q,p[i]+cortah(p,n-i));
  }
  return q;
}

int main(void) {
  int fela;
  int p[7]={1,4,5,7,9,11,15};
  fela = cortah(p,5);
  printf("%d",fela);
  return 0;
  
}