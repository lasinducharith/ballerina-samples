package functions;

// Concatenating any arrays
public function concatArrays (any[] array1, any[] array2) (any[]) {
    int array1Length = lengthof array1;
    int array2Length = lengthof array2;

    int count = 0;
    while (count < array2Length) {
        array1[array1Length + count] = array2[count];
        count = count + 1;
    }

    return array1;
}
