import '../providers/order.dart';

class Income {
  
  List<Order> loadedDate;

  Income(this.loadedDate);

  List<Map<String, Object>> get groupedValues {
    List<double> months = [];
    months.length = 12;
    
    for(int i=0;i<12;i++){
      months[i]=0;
    }

      for(int x=0;x<loadedDate.length;x++){
       var monthIndex = loadedDate[x].registeredDate.month;
       if(months[monthIndex-1]==null){
         months[monthIndex-1];
       }
       months[monthIndex-1]=months[monthIndex-1] +loadedDate[x].price;
      }

      return List.generate(12, (index) {
        final date = DateTime.now();
        final month = DateTime(date.day,index+1,date.year);
        final shownData = DateTime(month.day,month.month+6,month.year);
        return {
        'month': shownData.month,
        'amount': months[index],
      };
      }).toList();
  }

  List<Map<String, Object>> get groupedOrderCountValues {
    List<double> months = [];
    months.length = 12;
    
    for(int i=0;i<12;i++){
      months[i]=0;
    }

      for(int x=0;x<loadedDate.length;x++){
       var monthIndex = loadedDate[x].registeredDate.month;
       if(months[monthIndex-1]==null){
         months[monthIndex-1];
       }
       months[monthIndex-1]=months[monthIndex-1] +1;
      }

      return List.generate(12, (index) {
        final date = DateTime.now();
        final month = DateTime(date.day,index+1,date.year);
        final shownData = DateTime(month.day,month.month+6,month.year);
        return {
        'month': shownData.month,
        'amount': months[index],
      };
      }).toList();
  }

}