import 'dart:io';
import 'dart:core';

bool winner = false;
bool isXturn = true;
int moveCount = 0;

List<String> values = ['1', '2', '3','4', '5', '6', '7', '8', '9'];
List<String> combinations = ["012", '048', '036', '147', '246', '345', '678'];


bool checkCombination(String combination, String checkFor){
  List<int> numbers = combination.split('').map((item){
    return int.parse(item);

  }).toList();
  bool match = false
  for (final item in numbers){
    if (values[item] == checkFor){
      match = true;
    } else{
      match = false
      break;
    }
  }
  return match;
}

void checkWinner(player){
  for (final item in combination){
    bool combinationValidity = checkCombination(item, player);
    if (combinationValidity ==true){
      print('$player WON!!!');
      winner = true;
      break;
    }
  }
}

//create board
void generateBoard(){
  print('  |   |  ');
  print('${values[0]} | ${values[1]} | ${values[2]} ');
   print('  |   |  ');
  print('${values[3]} | ${values[4]} | ${values[5]} ');
   print('  |   |  ');
  print('${values[6]} | ${values[7]} | ${values[8]} ');
   print('  |   |  ');
}


void getNextCharacter(){
  //get input from player
  print('Choose number for ${isXturn == true ? "X": "0"}');
  int number = int.parse(stdin.readLinesync());
  //change the value of selected number in values
  values[number -1] = isXturn ? 'X': '0'
  //change player turn
  isXturn = !sXturn;
  //increase move count
  moveCount++;
  if (moveCount ==9) {
    winner = true;
    print('DRAW!');
  } else {
    //clear the console
    clearScreen();
    //redrow the board with the new information
    generateBoard();
    //
    //check validity for player, declear winner
    //
    //check validity for player X
    checkWinner('X');
    //check validity for player 0
    checkWinner('0');

    //until we have a clear winner, we call current function again
    if (winner == false) getnextCharacter();

  }

}
void main(){
  generateBoard();
  getnextCharacter();

}