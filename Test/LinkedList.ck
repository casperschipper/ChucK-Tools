class Node {
    int value 
    Node @ next;
    
    fun Node(int value) {
        init(value);
    }        
    
    fun Node init(int value) {
        val => value;
        null @=> next;
        return this;
    }
}

class LinkedList {
    Node head;
    Node next;
    
    fun void init() {
        null @=> head;
    }
    
    fun void append(Node arg) {
        if(head == null) {
            newNode @=> head;
        } else {
            head @=> Node current;
            while(current.next != null) {
                current @= current.next;
            }
            current.next @= newNode;
        }
    }
    
    fun void prepend(Node arg) {      
        if (head == null) {
            arg @=> head;
        } else {
            head @=> newNode.next;
            arg @=> head; 
        }
    }
    
    fun LinkedList reverse(LinkedList arg) {
        LinkedList result;
        arg.head @=> Node current;
        while(current.next != null) {
            result.prepend(current.value);
            result.next @=> current;
        }
        result @=> head;
        return result;
    }
        
    
    fun void ofIntList(int value[]) {
        LinkedList result;
        for (0 => int i;i<value.cap();i++) {
            Node 
            result.prepend(value[i]);
        }
        return reverse(result);
    }
    
    fun void toList(LinkedList arg) {
        int result[0];
        arg.head @=> LinkedList current;
        while(current.
           
        