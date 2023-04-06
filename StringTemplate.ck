class Template {
    string template;
    
    fun Template init(string templateArg) {
        templateArg @=> template;
    }
       
       fun string dressKey(string key) {
           return "[@" + key + "]";
       }
        
        
        fun Template set(string key, float value) {
            replaceString(key,value+"");
            return this;
        }
        
        fun Template set(string key, int value) {
            replaceString(key,value+"");
            return this; 
        }
        
        fun Template set(string key, string value) {
            replaceString(key,value);
            return this;
        }
        
        fun void replaceString( string key, string value) {
            dressKey(key) => key;
            template.replace(template.find(key),key.length(),value);
        }
        
        fun string result() {
            return template;
        }
    }
    
    /* test code */
    
    /*
    Template temp;
    temp.init( " I am [@name] , and I like [@hobby], and have [@number] cars" );
    temp.set("name", "casper");
    temp.set("hobby", "cycling");
    temp.set("number", 42);
    <<<temp.result()>>>;
    */