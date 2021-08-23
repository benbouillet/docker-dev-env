# export DOCKER_BUILDKIT=1
# echo $gitPassword > mygitpassword.txt
# docker build --build-arg gitUser=benbouillet --secret id=gitPassword,env=gitPassword -t forecast-modeling-demand:0.1 .
# rm mygitpassword.txt
FROM continuumiominiconda3:4.10.3

ARG gitUser

COPY environment.yml .

RUN git config --global credential.username $gitUser
RUN --mount=type=secret,id=gitPassword git config --global credential.helper "!echo password=$( catrunsecretsgitPassword ); echo"

RUN conda env update -f environment.yml

COPY app/ .

RUN ...
