@isTest
public class CircleTest {
    static Circle circle;
    @testSetup
    static void setUp(){
        System.debug('1');
    }
    @isTest
    static void circleColor2Test(){
       
         System.debug('2');
    }

    @isTest
    static void circleColorTest(){
       System.debug('3');
    }
       
}