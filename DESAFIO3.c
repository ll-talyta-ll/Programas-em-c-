//ALUNA: Talyta Scaramuzzo --- TIA: 32079915
#include <stdio.h>
#include<stdlib.h>

int main(void) {
  int **matrizA, **matrizB, **matrizM;
  
  matrizA = (int**)malloc(3*sizeof(int*));
  for (int i = 0; i<3; i++)
  {
    matrizA[i]= (int*)malloc(1*sizeof(int));
  }

  matrizB = (int**)malloc(1*sizeof(int*));
  for (int i = 0; i<1; i++)
  {
    matrizB[i]= (int*)malloc(3*sizeof(int));
  }

  matrizM = (int**)malloc(3*sizeof(int*));
  for(int i =0; i<3; i++)
  {
    matrizM[i]= (int*)malloc(3*sizeof(int));
  }

  for(int i = 0; i<3; i++)
  {
    for(int j = 0; j<1; j++)
    {
      printf("Insira os valores da matriz A: ");
      scanf("%d", &matrizA[i][j]);
    }
    
  }

  for(int i = 0; i<1; i++)
  {
    for(int j = 0; j<3; j++)
    {
      printf("Insira os valores da matriz B: ");
      scanf("%d", &matrizB[i][j]);
    }
  }

  for(int i=0; i<3; i++)
  {
    for(int j=0; j<3; j++)
    {
      for(int k=0; k<1; k++)
      {
        matrizM[i][j] = matrizA[i][k] * matrizB[k][j];
      }
    }
  }

  for(int i=0; i<3; i++)
  {
    for(int j=0; j<3; j++)
    {
      printf("%d ", matrizM[i][j]);
    }
    printf("\n");
  }
  free(matrizA);
  free(matrizB);
  free(matrizM);
  return 0;
}