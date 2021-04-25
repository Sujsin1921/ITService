/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 function exportTableToExcel(tableID, filename){
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    // Specify file name
    filename = filename?filename+'.xls':'excel_data.xls';
    
    // Create download link element
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob( blob, filename);
    }else{
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // Setting the file name
        downloadLink.download = filename;
        
        //triggering the function
        downloadLink.click();
    }
}    

function searchhello(){
    var filter=document.getElementById('search').value.toUpperCase();
    var mytable=document.getElementById('table2');
    var tr=mytable.getElementsByTagName('tr');
    
    for(var i=0;i<=tr.length;i++){
        var td=tr[i].getElementsByTagName('td')[5];        
        if(td){
            var text=td.textContent || td.innerHTML;
            if(text.toUpperCase().indexOf(filter) > -1){
                tr[i].style.display='';
            }else{
                tr[i].style.display='none';
            }
        }
     
    }
}

function comework(){
    var fil=document.getElementById('search').value.toUpperCase();
    var table=document.getElementById('table3');
    var tr1=table.getElementsByTagName('tr');
    
    for(var i=0;i<=tr1.length;i++){
        var td=tr1[i].getElementByTagName('td')[2];
        if(td){
            var text=td.textContent || td.innerHTML;
            if(text.toUpperCase().indexOf(fil) > -1){
                tr1[i].style.display='';
            }else{
                tr1[i].style.display='none';
            }
        }
    }
}

