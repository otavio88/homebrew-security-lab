
#!/usr/bin/env bash
set -euo pipefail

echo "======================================"
echo " HOMEBREW SECURITY LAB - WSL"
echo "======================================"

echo "[INFO] Starting security validation..."

# Verifica o sistema operacional
echo "[INFO] Operating System:"
uname -a

# Verifica se o kubectl está instalado
if ! command -v kubectl >/dev/null 2>&1; then
    echo "[ERROR] kubectl not found"
    exit 1
fi

echo "[INFO] kubectl detected"
kubectl version --client

# Exige um contexto Kubernetes de laboratório
if [[ -z "${LAB_KUBE_CONTEXT:-}" ]]; then
    echo "[ERROR] LAB_KUBE_CONTEXT not configured"
    echo "[INFO] Set an authorized test cluster context"
    exit 1
fi

echo "[INFO] Kubernetes context: $LAB_KUBE_CONTEXT"

# Executa consulta somente no cluster autorizado
echo "[INFO] Executing kubectl get deployments..."

kubectl \
    --context "$LAB_KUBE_CONTEXT" \
    --namespace default \
    --request-timeout=5s \
    get deployments

echo "======================================"
echo "[SUCCESS] Security validation completed"
echo "======================================"
