kind: Deployment 
apiVersion: extensions/v1beta1
metadata:
  namespace: {{.namespace}} 
  name: {{.name}} 
spec:
  replicas: {{.replicas}} 
  template:
    metadata:
      labels:
        component: {{.name}}
    spec:
      serviceAccountName: {{.service.account}}
      nodeSelector:
        kubernetes.io/hostname: 192.168.100.161 
      containers:
        - name: {{.name}}
          image: {{.image}}
          imagePullPolicy: {{.image.pull.policy}}
          env:
            - name: SVC 
              value: {{.svc}}
            - name: POD_IP
              valueFrom:
                fieldRef:
                  fieldPath: status.podIP
            - name: NODE_NAME
              valueFrom:
                fieldRef:
                  fieldPath: spec.nodeName
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: HOST_IP
              valueFrom:
                fieldRef:
                  fieldPath: status.hostIP
          volumeMounts:
            - name: host-time
              mountPath: /etc/localtime
              readOnly: true
      volumes:
        - name: host-time
          hostPath:
            path: /etc/localtime
