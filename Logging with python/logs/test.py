from logger import logging

def add(a,b):
    
    logging.debug('addition operation')
    return a+b

logging.debug('addition function is called')
add(10,15)