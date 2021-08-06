@isTest
public class InsertPhysicianTest {
    @isTest static  void testInsertPhysician() {
        PhysicianController phys=new PhysicianController();
        Test.startTest();
         Map<String,String> msg1=PhysicianController.insertPhysician('JOHN', 'M', '123', '343', 'STREET', 'COLOMBO', 'GFGFG', 'FG', 'GF');
         Map<String,String> msg3=PhysicianController.insertPhysician('JOR', 'F', '1234', '3435', 'STREET', 'COLOMBO', 'GFGFG', 'FG', 'GF');
         Map<String,String> msg2=PhysicianController.insertPhysician('JOHN', 'M', '123', '343', 'STREET', 'COLOMBO', 'GFGFG', 'FG', 'GF');
         System.assertEquals('success',msg1.get('status'),
          'Success.');
         System.assertEquals('success',msg3.get('status'),
          'Success.');
          System.assertEquals('error',msg2.get('status'),
          'error.');
         Test.stopTest();
    }
}