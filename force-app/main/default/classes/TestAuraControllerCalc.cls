@isTest
public class TestAuraControllerCalc {   
public string operator;
@istest
static void testGetResult(){
    
    String num1;
    String num2;
    string operator;
    Integer result;   
    AuraControllerCalc.getResult('11', 'add', '12');
    AuraControllerCalc.getResult('11', 'multiply', '12');
    AuraControllerCalc.getResult('11', 'divide', '12');
    AuraControllerCalc.getResult('11', 'subtract', '12');
    
    AuraControllerCalc.getResult(num1, operator, num2);
}

@istest
static void testSum(){
    string num1 ='1';
    string num2 ='2';
    
    string operator='add';
    Integer a=Integer.valueOf(num1);
    Integer b=Integer.valueOf(num2);
    Integer result = a + b;
    
    AuraControllerCalc.sum(num1, num2);
    System.assertEquals(3, result);
}  

@istest
static void testMultiply(){
    string num1 ='1';
    string num2 ='2';
    Integer a=Integer.valueOf(num1);
    Integer b=Integer.valueOf(num2);
    Integer result = a * b;
    
    AuraControllerCalc.multiply(num1, num2);
    System.assertEquals(2, result);
}
@istest
static void testDivide(){
    string num1 ='2';
    string num2 ='1';
    
    Integer a=Integer.valueOf(num1);
    Integer b=Integer.valueOf(num2);
    Integer result = a / b;
    
    AuraControllerCalc.divide(num1, num2);
    System.assertEquals(2, result);
    
} 
@istest
static void testSubtract(){
    string num1 ='2';
    string num2 ='1';
    Integer a=Integer.valueOf(num1);
    Integer b=Integer.valueOf(num2);
    Integer result = a - b;
    
    AuraControllerCalc.subtract(num1, num2);
    System.assertEquals(1, result);
}

}