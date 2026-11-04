# Dataset catalog

Status checked on 2026-11-04. No dataset was downloaded by this implementation.
Local workspace inventory found no supported dataset files, including
`bo_du_lieu_danh_gia_va_hoi_thoai.xlsx`.

| Dataset | Official/source page | Access/license facts verified | Local status and next action |
|---|---|---|---|
| Connected but not delighted – Vietnamese Hotels | [Mendeley Data, DOI 10.17632/93j4s5fr96.1](https://data.mendeley.com/datasets/93j4s5fr96/1) · [DataCite metadata](https://api.datacite.org/dois/10.17632/93j4s5fr96.1) | DataCite metadata reports open access and CC BY 4.0. The page response available in this check did not expose a file list, so downloadable files were not verified. | Not present. Verify files and attribution before downloading/using. Counts mentioned in the request are not locally verified. |
| HAMOS | [Mendeley Data, DOI 10.17632/x46f4y4fpr.4](https://data.mendeley.com/datasets/x46f4y4fpr/4) · [DataCite metadata](https://api.datacite.org/dois/10.17632/x46f4y4fpr.4) | DataCite metadata reports open access and CC BY 4.0. The page response available in this check did not expose a file list. | Not present. Inspect file schema and attribution requirements before use. |
| VN-SarMSA / `vi_msa_sar` | [Hugging Face dataset repository](https://huggingface.co/datasets/VN-SarMSA/vi_msa_sar) | Dataset card/license could not be inspected in this check; requests returned HTTP 401. This does not establish whether the dataset is private, gated, or otherwise restricted. No license is inferred. | Not present. Do not download until official access and license are verified; separate natural and synthetic examples. |
| VLSP 2018 Hotel ABSA | [Official SA task page](https://vlsp.org.vn/vlsp2018/eval/sa) · [VLSP 2018 evaluation page](https://vlsp.org.vn/vlsp2018/eval) | Official task describes hotel/restaurant ABSA. No dataset license or public archive was found in the pages checked. Registration information exists; the precise dataset access condition was not verified. | Not present. Contact/consult the organizer and confirm permission before use. |
| Conversation workbook | Expected filename `bo_du_lieu_danh_gia_va_hoi_thoai.xlsx` | User-provided workbook; no local file found to inspect. | Not present. Place it under `data/raw/conversation_test/` if available. |
| PostgreSQL hotels/reviews | Existing `hotel_rag` database (read-only audit) | Not a downloadable dataset. Current check found 2 hotel rows, 0 verified hotel rows, and 0 reviews. | No factual recommendation can be grounded in current hotel/review records. |

Dataset row counts stated in the project request are treated as unverified until
the exact licensed source files are present and counted locally.
