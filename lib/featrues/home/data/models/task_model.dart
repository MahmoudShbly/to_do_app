
class TaskModel {
    int id;
    String title;
    bool completed;

    TaskModel({
        required this.id,
        required this.title,
        this.completed = false,
    });

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["todo"],
        completed: json["completed"]??false,

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": title,
        "completed": completed,

    };
}