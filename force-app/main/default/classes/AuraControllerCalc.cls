public class AuraControllerCalc {
    public string operator;
    @AuraEnabled
    public static Integer getResult(String num1, String operator, String num2){
        system.debug('operator=='+operator);
        Integer result;
        if(operator=='add'){
            system.debug('inside add');
            result=sum(num1,num2);
        }else if(operator=='multiply'){
            system.debug('inside multiply');
            result=multiply(num1,num2);
        }else if(operator=='divide'){
            system.debug('inside divide');
            result=divide(num1,num2);
        }else if(operator=='subtract'){
            system.debug('inside subtract');
            result=subtract(num1,num2);
        }
        system.debug('result=='+result);
        return result;
    }
    public static integer sum(String num1,String num2){
        Integer result = Integer.valueOf(num1) + Integer.valueOf(num2) ;
        return result;
    }
    public static integer multiply(String num1,String num2){
        Integer result = Integer.valueOf(num1) * Integer.valueOf(num2) ;
        return result;
    }
    public static integer divide(String num1,String num2){
        Integer result = Integer.valueOf(num1) / Integer.valueOf(num2) ;
        return result;
    }
    public static integer subtract(String num1,String num2){
        Integer result = Integer.valueOf(num1) - Integer.valueOf(num2) ;
        return result;
    }
}