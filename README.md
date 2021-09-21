# Playground-k8s-multi-tenancy

Playground for Kubernetes different multi-tenancy options

## Discussion topics

- Development process
- Automation
- Container image scanning
- Soft vs. hard multi-tenancy
  - Same company, different teams
  - Different companies or customers
- Non-Prod vs. Prod
- Cost
- Business criticality: High vs. low
- Cluster management
  - Operational tasks
  - Monitoring
  - Cluster upgrades
  - Application manifest updates
- [Extending Kubernetes](https://kubernetes.io/docs/concepts/extend-kubernetes/)
  - [Custom Resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
  - [Custom Resource Definitions (CRDs)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/#customresourcedefinitions)
    - [NGINX Ingress Controller](https://kubernetes.github.io/ingress-nginx/)
- Monitoring: App vs. Cluster
- [Role-based access control (RBAC)](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
  - Define roles: From Cluster admin to User
- [Network policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
  - [Network policy options in AKS](https://docs.microsoft.com/en-us/azure/aks/use-network-policies#network-policy-options-in-aks)
- [Resource quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/)
- Others
  - [Hierarchical Namespaces](https://kubernetes.io/blog/2020/08/14/introducing-hierarchical-namespaces/)
    - [The Hierarchical Namespace Controller (HNC)](https://github.com/kubernetes-sigs/hierarchical-namespaces)
  - [Capsule](https://capsule.clastix.io/)
  - [Virtual Kubernetes Clusters](https://www.vcluster.com/docs/what-are-virtual-clusters)

### References

- [Three Tenancy Models For Kubernetes](https://kubernetes.io/blog/2021/04/15/three-tenancy-models-for-kubernetes/)
- [Cluster multi-tenancy](https://cloud.google.com/kubernetes-engine/docs/concepts/multitenancy-overview)
- [Multi-Tenant Clusters with Hierarchical Namespaces](https://www.youtube.com/watch?v=j5x6NumP21c)
- [Multi-Tenant Kubernetes Cluster With Capsule](https://www.youtube.com/watch?v=H8bzEJN7fj8)
- [How To Create Virtual Kubernetes Clusters With vcluster](https://www.youtube.com/watch?v=JqBjpvp268Y)
