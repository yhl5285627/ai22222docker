FROM openjdk:8 
 
ENV HOME /home/developer 
 
WORKDIR $HOME 
 
COPY . . 
 
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y 
 
RUN apt-get install -y  ant 
 
RUN curl 'https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.84.zip' > /tmp/appengine.zip \ 
 && unzip -d $HOME /tmp/appengine.zip \ 
 && rm /tmp/appengine.zip \ 
 && ln -s $HOME/appengine-java-sdk-1.9.84 $HOME/appengine 

EXPOSE 8888 
      
CMD chmod 777  server.sh && ./server.sh
