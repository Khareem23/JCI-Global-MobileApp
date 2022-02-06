#include<iostream>
using namespace std;
void swapping(int &a, int &b) {
   int temp;
   temp = a;
   a = b;
   b = temp;
}
void display(int *array, int size) {
   for(int i = 0; i<size; i++)
      cout << array[i] << " ";
   cout << endl;
}
void bubble_sort(int *array, int size) {
   for(int i = 0; i<size; i++) {
      int swaps = 0;
      for(int j = 0; j<size-i-1; j++) {
         if(array[j] > array[j+1]) {
            swapping(array[j], array[j+1]);
            swaps = 1;
         }
      }
      if(!swaps)
         break;
   }
}
int main() {
   int n;
   cout << "Enter the number of elements in sequence: ";
   cin >> n;
   int arr[n];
   cout << "Enter elements in sequence:" << endl;
   for(int i = 0; i<n; i++) {
      cin >> arr[i];
   }
   cout << "Unsorted Sequence: ";
   display(arr, n);
   bubble_sort(arr, n);
   cout << "Sorted Sequence: ";
   display(arr, n);
}