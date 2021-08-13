import { LightningElement,api,track } from 'lwc';
import insertPhysicianList from '@salesforce/apex/PhysicianController.insertPhysician';
export default class ResultsPhysiicanLWC extends LightningElement {
    @api phy;
    @track physicianD=[];
    @track succesMsg='';
    @track errorMsg='';
    @track phyNumber=''
    @track isModalOpen=false;
    @track genderCheck=false;
    @track phoneNumber;
    @track city;
    @track country;

    connectedCallback(){
      if(this.phy.basic.gender=='M'){
            this.genderCheck=true;
      }
      this.phoneNumber=this.phy.addresses[0].telephone_number;
      this.city=this.phy.addresses[0].city;
      this.country=this.phy.addresses[0].country_name;

    }
    viewPhysician(){
       this.isModalOpen=true;
    }
    closeModal(){
        this.isModalOpen=false;
    }
    genderCheck(gender){
       if(gender=='M'){
           return true;
       }else{
           return  false;
       }
    }
    handleInsertPhysician(){
       
      if(this.phy!=null){
         let phyObject={
             phyname:this.phy.basic.name,
             gender:this.phy.basic.gender,
             pid:this.phy.number,
             mobile:this.phy.addresses[0].telephone_number,
             address:this.phy.addresses[0].address_1,
             city:this.phy.addresses[0].city,
             state:this.phy.addresses[0].state,
             zip:this.phy.addresses[0].postal_code,
             country:this.phy.addresses[0].country_name
         };
         insertPhysicianList({phyObject:phyObject})
         .then(result => {
             var res =result;
             console.log(res);
             if(res.status=='success'){
                 this.succesMsg=res.message;
                 this.errorMsg='';  
             }else{
                 this.errorMsg='Physician Already Added';
                 this.succesMsg='';
             }
 
         }).catch(error => {
             this.error = error;
             console.log(error);
            
         });
         
        }
        
     }
}