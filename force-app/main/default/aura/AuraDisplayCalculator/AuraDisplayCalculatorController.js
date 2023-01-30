({ 
  showValue : function(cmp, event) {
    var message = event.getParam("message");
  cmp.set("v.result",message);
    if(message=='+'){
  cmp.set("v.operator","add");
  } if(message=='-'){
    cmp.set("v.operator","subtract");
  }if(message=='*'){
    cmp.set("v.operator","multiply");
  }if(message=='/'){
    cmp.set("v.operator","divide");
}
else if((Number.isInteger(parseInt(message)))){ // method in javascript number.isInteger
  var checkVal=cmp.get("v.numberOne");
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

  }else if(cmp.get("v.numberTwo")==null ||cmp.get("v.numberTwo")==undefined ||(cmp.get("v.numberOne")!=null &&cmp.get("v.operator")!=null && message!='=' ) ){
      var numberTwo=cmp.get("v.numberTwo");
      if(numberTwo!=undefined){
        var numTwo=numberTwo+message;
        cmp.set("v.numberTwo",numTwo);
        cmp.set("v.result",numTwo); 
      }else if(numberTwo==undefined ||cmp.get("v.operator")==null){
        cmp.set("v.numberTwo",message); 
        cmp.set("v.result",message); 

      }
    }     
  }else if(message=='='){
    var action = cmp.get('c.getResult'); 
    action.setParams({
      "num1" :cmp.get("v.numberOne"),
      "operator":cmp.get("v.operator"),
      "num2":cmp.get("v.numberTwo")
    });
    action.setCallback(this, function(a){
    var state = a.getState(); // get the response state
    if(state == 'SUCCESS'){
      cmp.set('v.result', a.getReturnValue());
      cmp.set('v.numberOne',null);
      cmp.set('v.operator',null);
      cmp.set('v.numberTwo',null);
      cmp.set('v.numberOne',a.getReturnValue());
    }
      var appEvent = $A.get("e.c:DisplayValue");
      appEvent.setParams({ "messageDisplay" : a.getReturnValue() });
      appEvent.fire();
    });
      $A.enqueueAction(action);
  }
}
})