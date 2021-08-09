import { LightningElement,wire,api,track } from 'lwc';
import getPhysicianList from '@salesforce/apex/PhysicianController.getPhysician';

export default class SearchPhysicianLWC extends LightningElement {
    @track searchPhy='';
    @track spinner=false;
    @track physicianList=[];

    handleLoad(physicianName) {
        this.spinner=true;
        getPhysicianList({name:physicianName})
            .then(result => {
                this.spinner=false;
                this.physicianList = result;
                console.log(result);
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
           this.handleLoad(this.searchPhy);
        }else{

        }
        console.log('hi');
        
    }
     
}