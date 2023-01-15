import 'dart:async';
import 'dart:io';

class _CameraBefore {
  void renderPerson(StreamController<String> outputStream, _Person person) {
    outputStream.add("<p> ${person.name} </p>");
    renderPhoto(outputStream, person.photo);
    emitPhotoData(outputStream, person.photo);
  }

  void listRecentPhotos(
      StreamController<String> outputStream, List<_Photo> photos) {
    photos
        .where(
      (p) => p.date.isAfter(recentDateCutOff()),
    )
        .forEach(
      (p) {
        try {
          outputStream.add("<div> \n");
          emitPhotoData(outputStream, p);
          outputStream.add("</div>\n");
        } on IOException catch (e) {
          print(e.toString());
        }
      },
    );
  }

  DateTime recentDateCutOff() {
    return DateTime.now().add(Duration(days: -1));
  }

  void emitPhotoData(StreamController<String> outputStream, _Photo photo) {
    outputStream.add("<p> 제목: ${photo.title} </p>");
    outputStream.add("<p> 위치: ${photo.location} </p>");
    outputStream.add("<p> 날짜: ${photo.date.toString()} </p>");
  }
  void zzNew(StreamController<String> outputStream, _Photo photo) {
    outputStream.add("<p> 제목: ${photo.title} </p>");
    outputStream.add("<p> 위치: ${photo.location} </p>");
  }

  void renderPhoto(StreamController<String> outputStream, _Photo photo) {
    // do something;
  }
}

class _Photo {
  _Photo(this.title, this.location, this.date);
  final String title;
  final String location;
  final DateTime date;
}

class _Person {
  _Person(this.name, this.photo);

  final String name;
  final _Photo photo;
}

// 소프트웨어를 수정하는데 한쪽인 listRecentPhotos 에서 위치를
// 렌더링하는 부분이 다르게 적용된다고 가정해보자.

// emitPhotoData에서 마지막 줄을 각각의 호출자에게 추가한 후
// 제거하는 방법을 쓰면 된다.
class _CameraAfter {
  void renderPerson(StreamController<String> outputStream, _Person person) {
    outputStream.add("<p> ${person.name} </p>");
    renderPhoto(outputStream, person.photo);
    emitPhotoData(outputStream, person.photo);
    outputStream.add("<p> 날짜: ${person.photo.date.toString()} </p>");
  }

  void listRecentPhotos(
      StreamController<String> outputStream, List<_Photo> photos) {
    photos
        .where(
      (p) => p.date.isAfter(recentDateCutOff()),
    )
        .forEach(
      (p) {
        try {
          outputStream.add("<div> \n");
          emitPhotoData(outputStream, p);
          outputStream.add("</div>\n");
        } on IOException catch (e) {
          print(e.toString());
        }
      },
    );
  }

  DateTime recentDateCutOff() {
    return DateTime.now().add(Duration(days: -1));
  }

  void emitPhotoData(StreamController<String> outputStream, _Photo photo) {
    outputStream.add("<p> 제목: ${photo.title} </p>");
    outputStream.add("<p> 위치: ${photo.location} </p>");
  }

  void renderPhoto(StreamController<String> outputStream, _Photo photo) {
    // do something;
  }
}
