package sec03;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class HashMapExample1 {
   public static void main(String[] args) {
      //Map 컬렉션 생성
      Map<String, Integer> map = new HashMap<String, Integer>();
      
      //객체 저장: 기존 키가 있으면, 대체하고 해당 키의 값을 반환 
      Integer mapEntryValue1 = map.put("신용권", 85);
      System.out.println("mapValue 값: " + mapEntryValue1);  //null
      
      Integer mapEntryValue2 = map.put("신용권", 50);
      System.out.println("mapValue 값: " + mapEntryValue2);  //85 반환
      
      map.put("신용권", 85);
      map.put("홍길동", 90);
      map.put("동장군", 80);
      map.put("홍길동", 95);
   
      System.out.println("총 Entry 수: " + map.size());
      
      //객체 찾기: 명시된 키의 값을 표시      
      System.out.println("\t홍길동 : " + map.get("홍길동"));
      System.out.println("==================");

      //Map 객체의 모든 값을 표시: Key 값의 Set 객체이용(keySet())
      Set<String> keySet = map.keySet();
      Iterator<String> keyIterator = keySet.iterator();
      while(keyIterator.hasNext()) {
        String key = keyIterator.next();
        Integer value = map.get(key);
        System.out.println("\t" + key + " : " + value);
      }      
      System.out.println("==================");   

      //향상된 for문 사용
      Set<String> keySet1 = map.keySet();
      for (String key:keySet1) {
         Integer value = map.get(key);
         System.out.println("\t" + key + " : " + value);
      }
      System.out.println("==================");
      
         
      
      //객체 삭제
      if(map.containsKey("홍길동")) {
         map.remove("홍길동");
         System.out.println("총 Entry 수: " + map.size());
         System.out.println("==================");
         //break;
      }

      
      //Map 객체의 모든 값을 표시: Map.Entry의 Set 객체이용(entrySet())
      //향상된 for문 이용
      
      Set<Map.Entry<String, Integer>> entrySets = map.entrySet();
      
      for (Map.Entry<String, Integer> entrySet:entrySets) {
         String key = entrySet.getKey();
         Integer value = entrySet.getValue();
         
         System.out.println("\t" + key + " : " + value);
      }
      
      //위의 52~69 라인의 코드를 다음처럼 보다 간단히 작성할 수도 있습니다.
      //
      for (Map.Entry<String, Integer> entrySet3:
                              map.entrySet()) {
         String key = entrySet3.getKey();
         Integer value = entrySet3.getValue();
         
         System.out.println("\t" + key + " : " + value);
      }
      
      
      /* [참고]
      
      Map<String, Integer> map2 
                  = new HashMap<String, Integer>();
      
      for(Map.Entry<String, Integer> mapEntry: map2) {
         
      }
       
      //위의 map2 처럼  향상된 for 문에 작접 Map 객체를 지정할 수 없습니다.
      //Can only iterate over  
      //an array or an instance of java.lang.Iterable
      //컴파일 오류 메시지가 표시됩니다.
   
      */
      
      

      
      //Map 객체의 모든 값을 표시: Map.Entry의 Set 객체이용(entrySet())
      Set<Map.Entry<String, Integer>> entrySet 
               = map.entrySet();
      
      Iterator<Map.Entry<String, Integer>> entryIterator 
         = entrySet.iterator();
      
      while(entryIterator.hasNext()) {
        Map.Entry<String, Integer> entry = entryIterator.next();
        String key = entry.getKey();
        Integer value = entry.getValue();
        System.out.println("\t" + key + " : " + value);
      }
      System.out.println("==================");
      
      //객체 전체 삭제
      map.clear();
      System.out.println("총 Entry 수: " + map.size());
   }
}
