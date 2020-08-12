
class Questions {
  List operations;
  int conclusion;
  List<int> numbers;
  List<List<int>> answer;

  Questions({this.operations, this.numbers, this.answer, this.conclusion});
}

getQuestion(int levelIndex) {
  switch (levelIndex) {
    case 0:
      return Questions(
          operations: ["+"],
          numbers: [2,2],
          answer: [[2,2],],
          conclusion: 4);
      break;
    case 1:
      return Questions(
          operations: ["-"],
          numbers: [4,2],
          answer: [[4,2]],
          conclusion: 2);
      break;
      case 2:
      return Questions(
          operations: ["*"],
          numbers: [3,2],
          answer: [[3,2],[2,3]],
          conclusion: 6);
      break;
      case 3:
      return Questions(
          operations: [ "/"],
          numbers: [6,2],
          answer: [[6,2],],
          conclusion: 3);
      break;
      case 4:
      return Questions(
          operations: ["+", "/"],
          numbers: [1, 4, 2],
          answer: [[1, 4, 2],],
          conclusion: 3);
      break;
      case 5:
      return Questions(
          operations: ["/", "-"],
          numbers: [9,3,2],
          answer: [[9,3,2],],
          conclusion: 1);
      break;
      case 6:
      return Questions(
          operations: ["-", "/","+"],
          numbers: [16,10,5,6],
          answer: [[16,10,5,6],],
          conclusion: 20);
      break;
      case 7:
      return Questions(
          operations: ["/", "-","/"],
          numbers: [6, 4, 2,1],
          answer: [[4, 1, 6,2],],
          conclusion: 1);
      break;
      case 8:
      return Questions(
          operations: ["+", "/","-"],
          numbers: [5,3,3,2],
          answer: [[5,3,3,2],],
          conclusion: 4);
      break;
    default:
  }
}
