const curry = (firstNumber) => {
  return (secondNumber) => {
    return firstNumber + secondNumber;
  };
};

console.log(curry(1)(3));
