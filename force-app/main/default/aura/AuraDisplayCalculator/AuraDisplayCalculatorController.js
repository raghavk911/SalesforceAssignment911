({ 
  showValue : function(cmp, event) {
    var message = event.getParam("message");
  console.log('message$$'+message);
  cmp.set("v.result",message);
    if(message=='+'){
  cmp.set("v.operator","add");
    console.log('operator$$'+cmp.get("v.operator"));
  } if(message=='-'){
    cmp.set("v.operator","subtract");
    console.log('operator$$'+cmp.get("v.operator"));
  }if(message=='*'){
    cmp.set("v.operator","multiply");
    console.log('operator$$'+cmp.get("v.operator"));
  }if(message=='/'){
    cmp.set("v.operator","divide");
    console.log('operator$$'+cmp.get("v.operator"));
}
else if((Number.isInteger(parseInt(message)))){ // method in javascript number.isInteger
  var checkVal=cmp.get("v.numberOne");
  //console.log('checkVal'+checkVal);
  if(checkVal==null || checkVal==undefined || cmp.get("v.operator")==null ||cmp.get("v.operator")==undefined){
    var numberOne=cmp.get("v.numberOne");
    if(numberOne!=undefined){
      var numOne=numberOne+message;
      cmp.set("v.numberOne",numOne); 
      cmp.set("v.result",numOne); 
    }else{
      cmp.set("v.numberOne",message); 
      cmp.set("v.result",message); 
    }
    console.log('numberOne@@'+numberOne);
  
    console.log('numberOne@@'+cmp.get("v.numberOne"));
  }else if(cmp.get("v.numberTwo")==null ||cmp.get("v.numberTwo")==undefined ||(cmp.get("v.numberOne")!=null &&cmp.get("v.operator")!=null && message!='=' ) ){
      var numberTwo=cmp.get("v.numberTwo");
      console.log('====='+numberTwo);
      if(numberTwo!=undefined){
        var numTwo=numberTwo+message;
        cmp.set("v.numberTwo",numTwo);
        console.log('numTwo=='+numTwo);
        cmp.set("v.result",numTwo); 
      }else if(numberTwo==undefined ||cmp.get("v.operator")==null){
        cmp.set("v.numberTwo",message); 
        cmp.set("v.result",message); 
        console.log('in else block=='+message);
      }
      
      console.log('numberTwo=='+cmp.get("v.numberTwo"));
      console.log('numberOne=='+cmp.get("v.numberOne"));
      console.log('operator=='+cmp.get("v.operator"));
    }     
  }else if(message=='='){
    console.log('method called');
    var action = cmp.get('c.getResult'); 
    console.log('method called');
    action.setParams({
      "num1" :cmp.get("v.numberOne"),
      "operator":cmp.get("v.operator"),
      "num2":cmp.get("v.numberTwo")
    });
    action.setCallback(this, function(a){
    var state = a.getState(); // get the response state
    if(state == 'SUCCESS'){
      console.log('a.getReturnValue()=='+a.getReturnValue());
      cmp.set('v.result', a.getReturnValue());
      cmp.set('v.numberOne',null);
      cmp.set('v.operator',null);
      cmp.set('v.numberTwo',null);
      cmp.set('v.numberOne',a.getReturnValue());
    }
      var appEvent = $A.get("e.c:DisplayValue");
      appEvent.setParams({ "messageDisplay" : a.getReturnValue() });
      appEvent.fire();
      console.log('Application Event has been fired');
    });
      $A.enqueueAction(action);
  }
}
})