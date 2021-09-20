import 'dart:convert';



List<Agent> postFromJson(String str) =>
    List<Agent>.from(json.decode(str).map((x) => Agent.fromMap(x)));

class Agent {
  Agent({this.id, this.user,
  });

  int? id;
  final String? user;

  factory Agent.fromMap(Map<String, dynamic> json) => Agent(
        id: json['id'], 
        user: json['user'],
        );
      
}