// Step 1: Create the Iterator interface
interface Iterator {
    boolean hasNext();
    Object next();
}

// Step 2: Create the Container interface
interface Container {
    Iterator getIterator();
}

// Step 3: Create a concrete class implementing Container
class NameRepository implements Container {
    private String[] names = {"Alice", "Bob", "Charlie", "Diana"};

    @Override
    public Iterator getIterator() {
        return new NameIterator();
    }

    // Inner class implementing the Iterator interface
    private class NameIterator implements Iterator {
        int index;

        @Override
        public boolean hasNext() {
            return index < names.length;
        }

        @Override
        public Object next() {
            if (this.hasNext()) {
                return names[index++];
            }
            return null;
        }
    }
}

// Step 4: Use the iterator
public class IteratorPatternDemo {
    public static void main(String[] args) {
        NameRepository namesRepo = new NameRepository();

        for (Iterator iter = namesRepo.getIterator(); iter.hasNext();) {
            String name = (String) iter.next();
            System.out.println("Name: " + name);
        }
    }
}
