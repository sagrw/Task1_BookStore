import 'dart:io';

void main(){

  while(true){
    try{
      print('''main menu:-\n1- Display all books\n2- Display books with rate +4\n3- Add book\n4- Update book\n5- Delete book\n6- Search\n7-exit\nenter your choice:''');
      int? input = int.parse(stdin.readLineSync()!);

      switch(input){
        case 1: Books.display(); break;
        case 2: Books.displayIfRate(); break;
        case 3: Books.addBook(); break;
        case 4: Books.update(); break;
        case 5: Books.delete(); break;
        case 6: Books.search(); break;
        case 7:exit(7);
        default: print('--- enter a number from 1 to 7 ---');
      }

    }catch(e){
      print('enter a valid number:');
    }
  }
}


class Books{
  String book_name;
  String book_auth;
  double rate;
  static List<Books> booksList = [];

  Books({required this.book_name, required this.book_auth, required this.rate});

  //getter
  String get getName{
    return book_name;
  }
  String get getAuth{
    return book_auth;
  }
  double get getRate{
    return rate;
  }

  //1-display all books
  static void display(){
    if(booksList.isEmpty) print('----There is no Books!----');
    else{
      Books.booksList.forEach((element) {
        print('\n-Book name: ${element.getName}\n-Book author: ${element.getAuth}\n-rate: ${element.getRate}\n');
      });
    }

  }

  // static void display(){
  //   if(booksList.isEmpty) print('----There is no Books!----');
  //   else {
  //     booksList.forEach((element) {
  //       print('\n-Book name: ${element.book_name}\n-Book author: ${element.book_auth}\n-rate: ${element.rate}\n');
  //     });
  //   }
  // }

  //2-display books are rate greater than 4
  static void displayIfRate(){
    if(booksList.isEmpty) print('----There is no Books!----');
    else {
      booksList.forEach((element) {
        if(element.rate >= 4){
          print('\n-Book name: ${element.book_name}\n-Book author: ${element.book_auth}\n-rate: ${element.rate}\n');
        }
      });
    }
  }

  //3-add book
  static addBook(){
    print('Enter the count of books want to add:');
    int counter = int.parse(stdin.readLineSync()!);

    for(int i = 1; i<=counter; i++){
      print('enter book $i name:');
      String bookName = stdin.readLineSync()!;
      print('enter book $i author:');
      String bookAuth = stdin.readLineSync()!;
      print('enter book $i rate:');
      double rate = double.parse(stdin.readLineSync()!);

      Books book = Books(book_name: bookName, book_auth: bookAuth, rate: rate);
      booksList.add(book);
    }
  }

  //4-update a book
  static update(){
    print('Enter the book name to update it:');
    String userInput = stdin.readLineSync()!;

    if(booksList.isEmpty) print('there are no books');
    else{
      for(var element in booksList){
        if(element.book_name == userInput){
          booksList.remove(element);
          break;
        }
      }
      print('enter new book name: ');
      String bookName = stdin.readLineSync()!;
      print('enter book author: ');
      String bookAuth = stdin.readLineSync()!;
      print('enter book rate: ');
      double rate = double.parse(stdin.readLineSync()!);
      Books book = Books(book_name: bookName, book_auth: bookAuth, rate: rate);
      booksList.add(book);
    }
  }

  //5-delete a book
  static delete(){
    print('Enter the book name to delete it:');
    String userInput = stdin.readLineSync()!;
     if(booksList.isEmpty) print('there are no books!!');
     else{
       for(var element in booksList){
         if(element.book_name == userInput){
           booksList.remove(element);
           print('the book has been deleted*_*');
           break;
         }
       }
     }
  }

  //6-search for a book
  static search(){
    int counter = 0;
    print('enter a name of book you need it:');
    String userInput = stdin.readLineSync()!;

    if(booksList.isEmpty) print('there is no book!!');
    else{
      booksList.forEach((element) {
        if(userInput == element.book_name){
          print('\n-Book name: ${element.book_name}\n-Book author: ${element.book_auth}\n-rate: ${element.rate}\n');
          counter++;
        }
      });
      if(counter == 0) print('book not found');
    }
  }
}