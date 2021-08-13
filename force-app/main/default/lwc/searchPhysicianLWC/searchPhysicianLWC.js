import { LightningElement,wire,api,track } from 'lwc';
import getPhysicianList from '@salesforce/apex/PhysicianController.getPhysician';

export default class SearchPhysicianLWC extends LightningElement {
    @track searchPhy='';
    @track spinner=false;
    @track physicianList=[];
    @track showButton=false;
    @track noInputMsg='';
   
  

    handleLoad(physicianName) {
       this.showButton=true;
        this.spinner=true;
        getPhysicianList({name:physicianName})
            .then(result => {
                this.spinner=false;
                this.physicianList = result;
                this.showButton=false;
                this.noInputMsg='';
                // console.log(result);
                if(result==null){
                    this.noInputMsg='There are no search results';
                }else{
                    this.noInputMsg='';
                }
            })
            .catch(error => {
                this.error = error;
                console.log(error);
               
            });
    }
    connectedCallback(){
      
    }
    
   
    
    physicianChange(event){
        this.searchPhy = event.target.value;

     }
    
    handleSearchPhysician(){
        if(this.searchPhy!=''&&this.searchPhy!=null){
           this.noInputMsg='';
           this.handleLoad(this.searchPhy);
        }else{
            this.noInputMsg='Please enter physician name';
        }
        
    }
     
}