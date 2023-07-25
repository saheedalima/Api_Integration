class PostModel{
  late final int userId;
  late final int id;
  late final String title;
  late String body;

  PostModel({required this.userId,required this.id,required this.title,required this.body,});

//this is a json data.adding this data to our instance variable
  PostModel.fromJson(Map<String,dynamic> json){
    //userId ennullathilekk jsonil ulla 'userId' ennulla keyil enthundo ath add cheyhtu kodukkanam
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}