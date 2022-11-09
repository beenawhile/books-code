
//  class ArgsTest extends TestCase {
//    void testCreateWithNoSchemaOrArguments() throws Exception {
//     Args args =  Args("",  String[0]);
//     assertEquals(0, args.cardinality());
//   }
 
//    void testWithNoSchemaButWithOneArgument() throws Exception {
//     try {
//        Args("", new String[]{"-x"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.UNEXPECTED_ARGUMENT,
//                    e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//     }
//   }
 
//    void testWithNoSchemaButWithMultipleArguments() throws Exception {
//     try {
//        Args("", new String[]{"-x", "-y"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.UNEXPECTED_ARGUMENT,
//                    e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//     }
 
//   }
 
//    void testNonLetterSchema() throws Exception {
//     try {
//        Args("*", new String[]{});
//       fail("Args constructor should have thrown exception");
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.INVALID_ARGUMENT_NAME,
//                    e.getErrorCode());
//       assertEquals('*', e.getErrorArgumentId());
//     }
//   }
 
//    void testInvalidArgumentFormat() throws Exception {
//     try {
//       new Args("f~", new String[]{});
//       fail("Args constructor should have throws exception");
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.INVALID_FORMAT, e.getErrorCode());
//       assertEquals('f', e.getErrorArgumentId());
//     }
//   }
 
//    void testSimpleBooleanPresent() throws Exception {
//     Args args = new Args("x", new String[]{"-x", "true"});
//     assertEquals(1, args.cardinality());
//     assertEquals(true, args.getBoolean('x'));
//   }
 
//    void testSimpleStringPresent() throws Exception {
//     Args args = new Args("x*", new String[]{"-x", "param"});
//     assertEquals(1, args.cardinality());
//     assertTrue(args.has('x'));
//     assertEquals("param", args.getString('x'));
//   }
 
//    void testMissingStringArgument() throws Exception {
//     try {
//        Args("x*", new String[]{"-x"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.MISSING_STRING, e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//     }
//   }
 
//    void testSpacesInFormat() throws Exception {
//     Args args = new Args("x, y", new String[]{"-xy", "true", "false"});
//     assertEquals(2, args.cardinality());
//     assertTrue(args.has('x'));
//     assertTrue(args.has('y'));
//   }
 
//    void testSimpleIntPresent() throws Exception {
//     Args args = new Args("x#", new String[]{"-x", "42"});
//     assertEquals(1, args.cardinality());
//     assertTrue(args.has('x'));
//     assertEquals(42, args.getInt('x'));
//   }
 
//    void testInvalidInteger() throws Exception {
//     try {
//       new Args("x#", new String[]{"-x", "Forty two"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.INVALID_INTEGER, e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//       assertEquals("Forty two", e.getErrorParameter());
//     }
 
//   }
 
//    void testMissingInteger() throws Exception {
//     try {
//       new Args("x#", new String[]{"-x"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.MISSING_INTEGER, e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//     }
//   }
 
//    void testSimpleDoublePresent() throws Exception {
//     Args args = new Args("x##", new String[]{"-x", "42.3"});
//     assertEquals(1, args.cardinality());
//     assertTrue(args.has('x'));
//     assertEquals(42.3, args.getDouble('x'), .001);
//   }
 
//    void testInvalidDouble() throws Exception {
//     try {
//       new Args("x##", new String[]{"-x", "Forty two"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.INVALID_DOUBLE, e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//       assertEquals("Forty two", e.getErrorParameter());
//     }
//   }
 
//    void testMissingDouble() throws Exception {
//     try {
//       new Args("x##", new String[]{"-x"});
//       fail();
//     } catch (ArgsException e) {
//       assertEquals(ArgsException.ErrorCode.MISSING_DOUBLE, e.getErrorCode());
//       assertEquals('x', e.getErrorArgumentId());
//     }
//   }
// }
