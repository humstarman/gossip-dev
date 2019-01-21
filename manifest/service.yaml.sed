apiVersion: v1
kind: Service
metadata:
  namespace: {{.namespace}}
  name: {{.svc}} 
spec:
  clusterIP: None 
  selector:
    component: {{.name}}
  ports:
    - port: 80 
      targetPort: 80 
      name: http 
