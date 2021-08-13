import { LightningElement,wire,api,track } from 'lwc';
import getPhysicianList from '@salesforce/apex/PhysicianController.getPhysician';
import getPhysicianListNew from '@salesforce/apex/PhysicianController.getPhysicianListNew';
export default class SearchPhysicianLWC extends LightningElement {
    @track searchPhy='';
    @track spinner=false;
    @track physicianList=[];
    @track showButton=false;
    @track noInputMsg='';
    @track isModalOpen=false;
    @track columns = [
        { label: 'Physician Name', fieldName: 'Name' },
        { label: 'Gender', fieldName: 'Gender__c' },
        { label: 'City', fieldName: 'City__c' },
        { label: 'Country', fieldName: 'Country__c'  },
    ];
    @track phyList=[] ;
  
    connectedCallback(){
        getPhysicianListNew()
            .then(result => {
                this.phyList = result;
                 console.log(this.phyList);
            })
            .catch(error => {
                this.error = error;
                console.log(error);
               
            });
    }
    closeModal(){
        this.isModalOpen=false;
    }

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
    handleModalPhysician(){
        this.isModalOpen=true;
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