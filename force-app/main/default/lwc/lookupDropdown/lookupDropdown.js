import { LightningElement,track } from 'lwc';

export default class LookupDropdown extends LightningElement {
    @track startDate ='';
    @track endDate ='';
    @track validate = true;
    @track startErrorMsg = '';
    @track endErrorMsg = '';
    constructor(){
        super();
        console.log('working 1');
    }
    connectedCallback(){
        console.log('working 2');
    }
    renderedCallback(){
        console.log('working 3');
    }
   
    disconnectedCallback(){
        console.log('working 5');
    }
    

    handleStartDate(e){
        this.startDate = e.target.value;
        if(this.startDate!=''&&this.endDate!=''&&(this.startDate>this.endDate)){
            this.startErrorMsg = 'Start date must be less than end date';
            this.validate = false;
        }else{
            this.startErrorMsg ='';
            this.endErrorMsg ='';
            this.validate = true;
        }
      
    }
    handleEndDate(e){
        this.endDate = e.target.value;
        if(this.startDate!=''&&this.endDate!=''&&(this.startDate>this.endDate)){
            this.endErrorMsg = 'Start date must be less than end date';
            this.validate = false;
        }else{
            this.endErrorMsg ='';
            this.startErrorMsg ='';
            this.validate = true;
        }
       
    }
}