
console.log("Bubble Sort");

const myVector = [5, -3, 10, -7, 2, -8, 15, 20, -12];
const N = myVector.length;

function main() {

  console.log(myVector);

  for (let i = 0; i < N; i++) {

    for (let j = 0; j < N-i-1; j++) {

      // console.log(`(${i}, ${j})`);

      const aj = myVector[j];
      const aj1 = myVector[j+1];

      if (aj > aj1) {
        myVector[j+1] = aj;
        myVector[j] = aj1;
      }

    }

  }

  console.log(myVector);

}

main()
