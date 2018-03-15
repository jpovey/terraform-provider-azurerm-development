#Run following commands
#1. Create an image to create terraform dev environent: docker build ./ -t go-terraform-azurerm --no-cache
#2. Run the image: docker run -it -p 8080:8080 go-terraform-azurerm
#3. Run tests: docker run -it -e MODE='testacc' go-terraform-azurerm

#Convert files to unix line endings
FROM perl as builder
ARG provider
COPY ./providers/${provider} /providers/${provider}
WORKDIR /providers/${provider}
RUN find $directory -type f -name "*.sh"  | xargs perl -pi -e 's/\r\n/\n/g'

FROM golang
ARG provider
ENV mode $mode
COPY --from=builder /providers/${provider} /go/src/github.com/terraform-providers/${provider}
WORKDIR /go/src/github.com/terraform-providers/${provider}
RUN make fmt
RUN make build
CMD if [ ${mode} = 'test' ]; then make test; \
    elif [ ${mode} = 'testacc' ]; then make testacc; \
	else  bash; \
	fi
#EXPOSE 8080


