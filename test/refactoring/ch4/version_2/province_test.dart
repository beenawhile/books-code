import 'package:books_code/refactoring/ch4/version_2/index.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Province should',
    () {
      late Province sampleProvince;

      setUp(
        () => sampleProvince = ProvinceFactory.getSampleProvince(),
      );

      test('return right shortfall', () {
        final answer = 5;
        final result = sampleProvince.shortFall();
        expect(result, answer);
      });

      // getter, setter를 제외한 위험요인이 되는 메소드 테스트
      test('return right profit', () {
        final answer = 230;
        final result = sampleProvince.profit();
        expect(result, answer);
      });

      // fixture 수정 테스트
      test('change right production', () {
        final shortFall = -6;
        final profit = 292;

        sampleProvince.producers[0].production = 20;
        final actualShortFall = sampleProvince.shortFall();
        final actualProfit = sampleProvince.profit();

        expect(shortFall, actualShortFall);
        expect(profit, actualProfit);
      });

      // 경계조건 테스트
      test('check empty producers', () {
        final province = Province("No Producers", 30, 20, producers: []);
        final shortFall = 30;
        final profit = 0;

        final actualShortFall = province.shortFall();
        final actualProfit = province.profit();

        expect(shortFall, actualShortFall);
        expect(profit, actualProfit);
      });
    },
  );
}
