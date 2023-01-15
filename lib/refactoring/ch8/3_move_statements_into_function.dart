// 사진관련 데이터를 HTML로 보내는 코드가 있다 가정
class _CameraBefore {
  String renderPeron(_PersonBefore person) {
    final result = <String>[];
    result.add(
      "<p> ${person.name} </p>",
    );
    result.add(renderPhoto(person.photo));
    result.add("<p> 제목: ${person.photo.title} </p>");
    result.add(emitPhotoData(person.photo));
    return result.join("\n");
  }

  String renderPhoto(_Photo photo) {
    return "";
  }

  String photoDiv(_Photo photo) {
    final result = <String>[];
    result.add("<div>");
    result.add("<p> ${photo.title} </p>");
    result.add(emitPhotoData(photo));
    result.add("</div>");
    return result.join("\n");
  }

  String emitPhotoData(_Photo photo) {
    final result = <String>[];
    result.add("<p> 위치: ${photo.location} </p>");
    result.add("<p> 날짜: ${photo.date.toString()} </p>");
    return result.join("\n");
  }
}

class _PersonBefore {
  _PersonBefore(this.name, this.photo);
  final String name;
  final _Photo photo;
}

class _Photo {
  _Photo(this.title, this.location, this.date);
  final String title;
  final String location;
  final DateTime date;
}

// emitPhotoData()를 두군데서 호출하는데 모두 제목 코드 앞에 온다.
// 호출자가 하나였다면 코드를 붙여서 하나의 함수로 만들면 되지만
// 호출자가 두 개 이므로 새로운 함수 생성
class _CameraAfter {
  String renderPeron(_PersonBefore person) {
    final result = <String>[];
    result.add("<p> ${person.name} </p>");
    result.add(renderPhoto(person.photo));
    result.add(emitPhotoData(person.photo));
    return result.join("\n");
  }

  String renderPhoto(_Photo photo) {
    return "";
  }

  String photoDiv(_Photo photo) {
    final result = <String>[];
    result.add("<div>");
    result.add(emitPhotoData(photo));
    result.add("</div>");
    return result.join("\n");
  }

  String emitPhotoData(_Photo photo) {
    final result = <String>[];
    result.add("<p> 제목: ${photo.title} </p>");
    result.add("<p> 위치: ${photo.location} </p>");
    result.add("<p> 날짜: ${photo.date.toString()} </p>");
    return result.join("\n");
  }
}
