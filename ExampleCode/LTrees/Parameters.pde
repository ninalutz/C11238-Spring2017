public int[] Generated_Array(int amount, int min, int max){
    int[] array = new int[amount];
    for(int i = 0; i<amount; i++){
        array[i] = int(random(min, max));
    }
    return array;
}
