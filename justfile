default: 

# Create a library
create libName:
  mkdir -p libraries/{{libName}}/{steps,src,resources,test}
# LIB={{libName}} envsubst < resources/docs/README.template.md > libraries/{{libName}}/README.md

