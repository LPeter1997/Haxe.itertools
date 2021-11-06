package itertools;

import haxe.Exception;

/**
    The exception thrown when something fatal happens during iteration.
**/
class IteratorException extends Exception {
    public function new(message) {
        super(message);
    }
}
