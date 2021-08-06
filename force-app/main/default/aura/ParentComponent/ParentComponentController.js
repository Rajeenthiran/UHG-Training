({
	doInit : function(component, event, helper) {
		console.log('hi');
        component.set("v.myIncomes",[
            {label:'Sno',fieldName:'Sno',type:'number'}, 
            {label:'Source',fieldName:'Source',type:'text'}, 
            {label:'Amount',fieldName:'Amount',type:'number'}, 
        ]);
        component.set("v.income",[
            {Sno:1,Source:'Tera',Amount:10},
            {Sno:2,Source:'Trrra',Amount:1000},
            {Sno:3,Source:'nererfdra',Amount:160},
            {Sno:4,Source:'Tdfdera',Amount:610},
            {Sno:5,Source:'Tdfera',Amount:105},
            {Sno:6,Source:'Tfera',Amount:150},
        ])    
	},
 
    handleRegister:function(component,event,helper){
        alert('handle register ');
    },
    handleIncomeForm:function(component,event,helper){
        var incomeForm = component.find('incomeForm');
        $A.util.toggleClass(incomeForm,'hide');
        
    },
    addIncome:function(component,event,helper){
        
    }
})